package salesforce.security
#####################################
# PERMISSION SET RULES
#####################################

# ViewAllData is dangerous
deny[msg] if {
  some ps in input.PermissionSet
  some p in ps.userPermissions
  p.name == "ViewAllData"
  p.enabled == "true"
  msg := sprintf("SECURITY VIOLATION: PermissionSet '%s' grants dangerous ViewAllData permission. [OWASP A01: Broken Access Control]", [ps.label])
}

# Warning on suspicious descriptions
warn[msg] if {
  some ps in input.PermissionSet
  contains(lower(ps.description), "all data")
  msg := sprintf("WARNING: PermissionSet '%s' description suggests overly broad data access. [OWASP A01: Broken Access Control]", [ps.label])
}

# Guest User dangerous permissions
deny[msg] if {
  some ps in input.PermissionSet
  ps.label == "Guest User"
  some p in ps.userPermissions
  p.enabled == "true"
  msg := "SECURITY VIOLATION: Guest User PermissionSet grants dangerous permissions. [OWASP A01: Broken Access Control]"
}
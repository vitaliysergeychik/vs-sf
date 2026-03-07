package salesforce.security

#####################################
# PERMISSION SET RULES
#####################################

# ViewAllData is dangerous
deny contains msg if {
  perm := input.PermissionSet.userPermissions[_]
  perm.name == "ViewAllData"
  perm.enabled == "true"

  msg := sprintf(
    "SECURITY VIOLATION: PermissionSet '%s' grants dangerous ViewAllData permission. [OWASP A01: Broken Access Control]",
    [input.PermissionSet.label]
  )
}

# Warning on suspicious descriptions
warn contains msg if {
  input.PermissionSet.description != ""
  contains(lower(input.PermissionSet.description), "all data")

  msg := sprintf(
    "WARNING: PermissionSet '%s' description suggests overly broad data access. [OWASP A01: Broken Access Control]",
    [input.PermissionSet.label]
  )
}

# Guest User dangerous permissions
deny contains msg if {
  input.PermissionSet.label == "Guest User"
  perm := input.PermissionSet.userPermissions[_]
  perm.enabled == "true"

  msg := "SECURITY VIOLATION: Guest User PermissionSet grants dangerous permissions. [OWASP A01: Broken Access Control]"
}

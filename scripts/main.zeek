@load spicy-ldap
@load base/frameworks/notice

module LDAPDetection;

export {
    redef enum Notice::Type += {
        Suspicious_LDAP_Activity
    };

    const suspicious_filters: set[string] = {
    "(groupType:1.2.840.113556.1.4.803:=2147483648)",
    "(groupType:1.2.840.113556.1.4.803:=2147483656)",
    "(groupType:1.2.840.113556.1.4.803:=2147483652)",
    "(groupType:1.2.840.113556.1.4.803:=2147483650)",
    "(sAMAccountType=805306369)",
    "(sAMAccountType=805306368)",
    "(sAMAccountType=536870913)",
    "(sAMAccountType=536870912)",
    "(sAMAccountType=268435457)",
    "(sAMAccountType=268435456)",
    "(objectCategory=groupPolicyContainer)",
    "(objectCategory=organizationalUnit)",
    "(objectCategory=Computer)",
    "(objectCategory=nTDSDSA)",
    "(objectCategory=server)",
    "(objectCategory=domain)",
    "(objectCategory=person)",
    "(objectCategory=group)",
    "(objectCategory=user)",
    "(objectClass=trustedDomain)",
    "(objectClass=computer)",
    "(objectClass=server)",
    "(objectClass=group)",
    "(objectClass=user)",
    "(primaryGroupID=521)",
    "(primaryGroupID=516)",
    "(primaryGroupID=515)",
    "(primaryGroupID=512)",
    "Domain Admins",
    "objectGUID=*",
    "(schemaIDGUID=*)",
    "admincount=1"
    };
}

event LDAP::log_ldap_search(rec: LDAP::Search) {
    for (filter in LDAPDetection::suspicious_filters) {
        if (filter in rec$filter) {  # Check if filter is a substring of rec$filter
        print fmt("Suspicious LDAP query detected: %s, %s", rec$filter, rec$id);
        NOTICE([$note=Suspicious_LDAP_Activity, $msg=fmt("Suspicious LDAP query detected: %s", rec$filter), $identifier=rec$filter]);
            break;
        }
    }
}
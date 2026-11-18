-- Threat: !InfrastructureShared
-- Name: eeb357d0a84b
-- Type: 21
-- Includes: BMLuaLib

checkLogonSuccessEvent(this_sigattrlog[5])
reportLuaErrors("LogonSuccess.B")
return mp.CLEAN

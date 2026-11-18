-- Threat: !InfrastructureShared
-- Name: eeb36f03500a
-- Type: 21
-- Includes: BMLuaLib

checkLogonSuccessEvent(this_sigattrlog[5])
reportLuaErrors("LogonSuccess.B")
return mp.CLEAN

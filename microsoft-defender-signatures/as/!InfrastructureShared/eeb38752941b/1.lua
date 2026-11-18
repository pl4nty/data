-- Threat: !InfrastructureShared
-- Name: eeb38752941b
-- Type: 21
-- Includes: BMLuaLib

checkLogonSuccessEvent(this_sigattrlog[5])
reportLuaErrors("LogonSuccess.A")
return mp.CLEAN

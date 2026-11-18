-- Threat: !InfrastructureShared
-- Name: !#LUA:VeriatoCertClean
-- Type: 8
-- MpAttributes: RPF:TopLevelFile & CERT:Clean:Veriato & !PUA:Exception

if peattributes.isexe == true or peattributes.isdll == true then
  mp.set_mpattribute("LUA:VeriatoCertClean")
  return mp.INFECTED
end
return mp.CLEAN

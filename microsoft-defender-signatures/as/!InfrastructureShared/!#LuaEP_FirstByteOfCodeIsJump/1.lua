-- Threat: !InfrastructureShared
-- Name: !#Lua:EP_FirstByteOfCodeIsJump
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if pehdr.AddressOfEntryPoint == 4096 and epcode[1] == 233 then
  return mp.INFECTED
end
return mp.CLEAN

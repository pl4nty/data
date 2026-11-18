-- Threat: !InfrastructureShared
-- Name: !#Lua:FileAgeCheck
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 < 86400 then
  mp.set_mpattribute("Lua:FileCreatedLT1d")
end
if l_0_0 < 604800 then
  mp.set_mpattribute("Lua:FileCreatedLT7d")
else
  mp.set_mpattribute("Lua:FileCreatedGT7d")
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: !#Lua:PeOrignalName/PowerLeechExclu.dll
-- Type: 10
-- MpAttributes: Lua:CloudBlockLevelGT3

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil and l_0_0.OriginalFilename ~= nil then
  local l_0_1 = string.lower(l_0_0.OriginalFilename)
  if l_0_1:find("powerleech", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

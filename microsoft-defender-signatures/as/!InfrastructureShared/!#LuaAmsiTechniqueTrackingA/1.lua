-- Threat: !InfrastructureShared
-- Name: !#Lua:AmsiTechniqueTracking.A
-- Type: 24
-- Includes: TechniqueTracker
-- MpAttributes: Lua:AmsiAppContextDataPresent

local l_0_0 = false
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = "BM_MT"
local l_0_4 = mp.enum_mpattributesubstring(l_0_3)
if l_0_4 ~= nil and type(l_0_4) == "table" and 0 < #l_0_4 then
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    local l_0_7 = string.sub(l_0_6, #l_0_3, #l_0_6)
    if l_0_7 ~= nil and 5 <= #l_0_7 then
      local l_0_8, l_0_9 = string.match(l_0_7, "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
      TrackPidAndTechnique(l_0_2, l_0_8, l_0_9)
      l_0_0 = true
    end
  end
end
if l_0_0 and mp.get_mpattribute("Lua:CloudBlockLevelGT5") and 3 < #l_0_4 then
  mp.set_mpattribute("Lua:AmsiTechniqueTracking")
end
return mp.CLEAN

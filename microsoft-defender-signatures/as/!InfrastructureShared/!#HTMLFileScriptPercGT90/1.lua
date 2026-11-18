-- Threat: !InfrastructureShared
-- Name: !#HTMLFileScriptPercGT90
-- Type: 13
-- MpAttributes: SCRIPT:HasScriptTag.A & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 4096 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetNormalizedScript(true):lower()
local l_0_2 = string.gsub(l_0_1, "<script.-</script>", "")
if #l_0_1 - #l_0_2 > #l_0_1 * 90 / 100 then
  return mp.INFECTED
end
return mp.CLEAN

-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#HTMLFileScriptPercGT90\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 4096 then
  return mp.CLEAN
end
local l_0_1 = ((mp.GetNormalizedScript)(true)):lower()
if #l_0_1 * 90 / 100 < #l_0_1 - #(string.gsub)(l_0_1, "<script.-</script>", "") then
  return mp.INFECTED
end
return mp.CLEAN


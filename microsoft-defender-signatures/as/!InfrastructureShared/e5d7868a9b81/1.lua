-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e5d7868a9b81\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ((mp.GetProcessCommandLine)(l_0_0)):lower()
if not l_0_1 then
  return mp.CLEAN
end
for l_0_5 in l_0_1:gmatch("(%d+%.%d+%.%d+%.%d+)") do
  local l_0_6 = {}
  for l_0_10 in l_0_5:gmatch("(%d+)") do
    (table.insert)(l_0_6, l_0_10)
  end
  if #l_0_6 == 4 then
    for l_0_14,l_0_15 in ipairs(l_0_6) do
      if (#l_0_15 > 1 and l_0_15:match("^0%d")) or tonumber(l_0_15) > 255 then
        return mp.INFECTED
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC65: Confused about usage of register R2 for local variables in 'ReleaseLocals'



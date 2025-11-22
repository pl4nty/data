-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanJSGlasswormZ!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 15360 or l_0_0 > 51200 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
do
  local l_0_1 = tostring((mp.readfile)(0, l_0_0)) or ""
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = nil
  do
    if (function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_3
  for l_1_4,l_1_5 in ipairs(l_0_3) do
    if l_1_0:find(l_1_5, 1, true) then
      return true
    end
  end
  return false
end
)(l_0_2) then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC52: freeLocal<0 in 'ReleaseLocals'

  end
end


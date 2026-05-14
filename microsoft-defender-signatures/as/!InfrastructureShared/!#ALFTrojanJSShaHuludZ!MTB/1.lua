-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanJSShaHuludZ!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 3145728 then
  l_0_0 = 3145728
end
;
(mp.readprotection)(false)
do
  local l_0_1, l_0_2 = tostring((mp.readfile)(0, l_0_0)) or ""
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = nil
  local l_0_4 = nil
  if detect_token_harvesting((string.lower)(l_0_1)) then
    (mp.set_mpattribute)("MiniShaiHulud.TokenHarvesting")
    return mp.INFECTED
  end
  return mp.CLEAN
end


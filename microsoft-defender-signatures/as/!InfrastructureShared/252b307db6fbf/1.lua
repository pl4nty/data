-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\252b307db6fbf\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC23: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[2]).utf8p2
    end
    if not (this_sigattrlog[4]).matched or not (this_sigattrlog[4]).utf8p2 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_4 = (string.lower)((this_sigattrlog[4]).utf8p2)
    local l_0_5 = (string.match)(l_0_4, "<conditions>.*path=\"(.-)\".*</conditions>")
    if l_0_5 and ((string.find)(l_0_5, "program files\\windows defender\\", 1, true) or (string.find)(l_0_5, "\\windows defender advanced threat protection", 1, true)) then
      return mp.INFECTED
    end
    l_0_5 = (string.match)(l_0_4, "<conditions>.*binaryname=\"(.-)\".*</conditions>")
    if l_0_5 and isMDEBlockingPolicy(l_0_5) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end


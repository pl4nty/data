-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\181b37320844e\0x00000972_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

  if ((this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil and (string.lower)((this_sigattrlog[6]).utf8p1) == nil) or #(string.lower)((this_sigattrlog[6]).utf8p1) < 3 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

  if (string.match)((string.lower)((this_sigattrlog[6]).utf8p1), "/%.[^/]+$") then
    (bm.add_related_file)((string.lower)((this_sigattrlog[6]).utf8p1))
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
  return mp.CLEAN
end


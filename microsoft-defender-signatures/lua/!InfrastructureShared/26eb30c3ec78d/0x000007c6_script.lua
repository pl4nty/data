-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\26eb30c3ec78d\0x000007c6_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  if (not (this_sigattrlog[12]).matched or (this_sigattrlog[12]).utf8p2 == nil or (this_sigattrlog[1]).matched) and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_2 = (string.lower)((this_sigattrlog[12]).utf8p2)
    local l_0_3 = nil
    if ((string.lower)((this_sigattrlog[1]).utf8p1)):match("_exec:(.+)$") ~= nil and l_0_2:find(((string.lower)((this_sigattrlog[1]).utf8p1)):match("_exec:(.+)$"), 1, true) then
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end


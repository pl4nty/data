-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5ea_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = nil
  end
  local l_0_1 = nil
  -- DECOMPILER ERROR at PC26: Overwrote pending register: R1 in 'AssignReg'

  if ((this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and l_0_1 == nil) or nil == nil then
    return mp.CLEAN
  end
  local l_0_2 = nil
  local l_0_3 = (string.match)((string.lower)(l_0_1), "([^\\]+)$")
  if l_0_3 == nil or (string.match)((string.lower)(l_0_2), "([^\\]+)$") == nil then
    return mp.CLEAN
  end
  if #l_0_3 < #(string.match)((string.lower)(l_0_2), "([^\\]+)$") and (string.sub)((string.match)((string.lower)(l_0_2), "([^\\]+)$"), 1, #l_0_3) == l_0_3 then
    return mp.INFECTED
  end
  return mp.CLEAN
end


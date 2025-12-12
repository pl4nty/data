-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\76b306579525\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if contains(l_0_3, {"downloadstring", "|iex", "|invoke-expression", "iwr", "invoke-webrequest", "frombase64string", "-enc", "-mppreference", "whoami", "hostname", "system.net.webclient", "localgroup administrators", "amsiinitfailed", "getfield"}) then
    return mp.INFECTED
  end
  return mp.CLEAN
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2d3b36270c8eb\0x0000122f_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  local l_0_2 = nil
  local l_0_3 = contains
  local l_0_4 = l_0_2
  l_0_3 = l_0_3(l_0_4, {"captcha", "human", "robot", "verif", "free", "ray", "cloudflare", "microsoft windows", "telegram", "DNS service", ".mp3", ".mp4", ".flv", ".mdb", ".eps", "-replace", ".dat", ".xll", ".m4a"})
  if l_0_3 then
    l_0_3 = mp
    l_0_3 = l_0_3.INFECTED
    return l_0_3
  end
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\57b38612a122\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  local l_0_3 = contains
  local l_0_4 = l_0_2
  l_0_3 = l_0_3(l_0_4, {"captcha", "human", "robo", "verif", "free", "ray", "cloudflare", "microsoft windows", "telegram", ".mp3", ".mp4", ".flv", ".mdb", ".eps", "-replace", "DNS service", ".dat", ".xll", ".m4a"})
  if l_0_3 then
    l_0_3 = mp
    l_0_3 = l_0_3.INFECTED
    return l_0_3
  end
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end


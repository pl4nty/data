-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6ab3457e63fa\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  local l_0_2 = nil
  if contains(l_0_2, {"profisee/kubernetes/master/azure-arm"}) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if contains(l_0_2, {"pastebin.com", "paste.ee", "paste.gg", "j.mp", "bit.ly", "bitly.com", "textbin.net"}) then
    (bm.add_related_string)("CurlPublicStager_cmdline", l_0_2, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
  return mp.CLEAN
end


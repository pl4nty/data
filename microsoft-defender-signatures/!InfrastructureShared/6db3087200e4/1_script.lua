-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6db3087200e4\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC25: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p1) and not isnull((this_sigattrlog[1]).utf8p2) then
  local l_0_0 = nil
  local l_0_1, l_0_2 = pcall(string.match, l_0_0, "remoteip:(.+):%d+")
  if l_0_1 and not isnull(l_0_2) then
    (bm.add_related_string)("[i] MALICIOUS URL: ", l_0_2, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("[i] MALICIOUS CONNECTION INFO: ", l_0_0, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end


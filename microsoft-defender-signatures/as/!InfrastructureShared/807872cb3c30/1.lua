-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\807872cb3c30\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS ~= l_0_0 then
  if peattributes.isexe then
    return mp.CLEAN
  end
  local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if not isnull(l_0_1) and (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
    return mp.CLEAN
  end
  if checkIfCertificateHit() then
    return mp.CLEAN
  end
end
do
  if mp.HSTR_CALLER_SMS == l_0_0 then
    return mp.INFECTED
  end
  ;
  (mp.set_mpattribute)("Trojan:Win32/SuspLokiScexecLoad.A")
  return mp.LOWFI
end


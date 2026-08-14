-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3878bf3f42df\1.luac 

-- params : ...
-- function num : 0
if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = (mp.GetCertificateInfo)()
if not isnull(l_0_0) then
  for l_0_4,l_0_5 in pairs(l_0_0) do
    if l_0_5.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
do
  if checkIfCertificateHit() then
    return mp.CLEAN
  end
  local l_0_6 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if not isnull(l_0_6) and (mp.IsKnownFriendlyFile)(l_0_6, true, false) then
    return mp.CLEAN
  end
  return mp.INFECTED
end


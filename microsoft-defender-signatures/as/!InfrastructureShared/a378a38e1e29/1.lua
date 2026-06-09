-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a378a38e1e29\1.luac 

-- params : ...
-- function num : 0
if not (hstrlog[2]).matched then
  return mp.CLEAN
end
if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if not isnull(l_0_0) and (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetCertificateInfo)()
if not isnull(l_0_1) then
  for l_0_5,l_0_6 in pairs(l_0_1) do
    if l_0_6.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
do
  if checkIfCertificateHit() then
    return mp.CLEAN
  end
  return mp.INFECTED
end


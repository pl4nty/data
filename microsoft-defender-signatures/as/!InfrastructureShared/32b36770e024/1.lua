-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b36770e024\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  l_0_0 = safeJsonDeserialize(l_0_0)
  if not l_0_0 or not l_0_0.HttpCommand or not l_0_0.ServerName or not l_0_0.UrlPath then
    return mp.CLEAN
  end
  local l_0_1 = "Appomaly_Network_HttpRequests"
  local l_0_2 = l_0_0.ServerName .. "_" .. l_0_0.HttpCommand .. "_" .. l_0_0.UrlPath
  local l_0_3, l_0_4, l_0_5 = AnomalyTableCheck(l_0_1, l_0_2, 5, "MarkerRecord_" .. l_0_0.ServerName)
  if l_0_3 and not l_0_4 then
    local l_0_6 = {}
    l_0_6.TrackedProcess = l_0_0.ServerName
    l_0_6.SignatureName = "PFAppAnomalousInbound.A"
    l_0_6.AnomalyTableInfo = l_0_5
    l_0_6.AnomalyTableName = l_0_1
    l_0_6.Key = l_0_2
    l_0_0.ConnectionString = (bm.get_connection_string)()
    l_0_6.ConnectionInfo = l_0_0
    ;
    (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_6), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end


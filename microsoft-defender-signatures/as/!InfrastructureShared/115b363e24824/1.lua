-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\115b363e24824\1.luac 

-- params : ...
-- function num : 0
if IsADConnectRole() then
  return mp.CLEAN
end
if (bm.GetSignatureMatchDuration)() > 100000000 then
  return mp.CLEAN
end
do
  if (versioning.GetEngineBuild)() >= 16700 then
    local l_0_0 = (versioning.GetOrgID)()
    if l_0_0 then
      (bm.add_related_string)("EntraConnectCompromiseOrgA", l_0_0, bm.RelatedStringBMReport)
    end
  end
  return mp.INFECTED
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\86b39ebaa65c\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 then
  local l_0_0 = ((this_sigattrlog[1]).utf8p1):match("([^\\]+)$")
  local l_0_1 = GetRollingQueueKeys("NewlyRegisteredServices_Name")
  if l_0_1 then
    for l_0_5,l_0_6 in ipairs(l_0_1) do
      if contains(l_0_0, l_0_6) then
        (bm.add_related_string)("RegisteredSrv", l_0_0, bm.RelatedStringBMReport)
        local l_0_7 = reportRelevantUntrustedEntities(0)
        if l_0_7 and next(l_0_7) then
          (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_7), bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.CLEAN
  return l_0_0
end


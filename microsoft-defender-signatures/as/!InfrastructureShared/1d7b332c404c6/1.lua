-- Threat: !InfrastructureShared
-- Name: 1d7b332c404c6
-- Type: 21

local l_0_0 = mp.enum_mpattributesubstring("Behavior:Win32/BlockMpTamper")
if #l_0_0 == 0 or l_0_0 == nil then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  bm.add_related_string("RelatedBMHits", l_0_2, bm.RelatedStringBMReport)
end
local l_0_3
for l_0_4 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_4].matched and sigattr_tail[l_0_4].attribute == 16393 then
    l_0_3 = sigattr_tail[l_0_4].utf8p2
    if l_0_3 ~= nil then
      local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_3)
      if l_0_5 ~= nil and 0 < #l_0_5 then
        for l_0_6, l_0_7 in ipairs(l_0_5) do
          l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
          if sysio.IsFileExists(l_0_7) then
            bm.add_related_file(l_0_7)
          end
        end
      end
    end
  end
end
return mp.INFECTED

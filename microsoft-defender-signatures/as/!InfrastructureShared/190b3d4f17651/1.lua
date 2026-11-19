-- Threat: !InfrastructureShared
-- Name: 190b3d4f17651
-- Type: 21

local l_0_0 = mp.enum_mpattributesubstring("Behavior:Win32/BlockMpTamper")
if #l_0_0 == 0 or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("Behavior:Win32/ShadowCopyDelete")
local l_0_2 = mp.enum_mpattributesubstring("Behavior:Win32/RunsBcdedit")
local l_0_3 = mp.enum_mpattributesubstring("Behavior:Win32/StartupRepair")
local l_0_4 = mp.enum_mpattributesubstring("Behavior:Win32/FsutilUsnDeleteJournal")
if 0 < #l_0_1 or 0 < #l_0_2 or 0 < #l_0_3 or 0 < #l_0_4 then
  for l_0_5, l_0_6 in ipairs(l_0_0) do
    bm.add_related_string("RelatedBMHits", l_0_6, bm.RelatedStringBMReport)
  end
  local l_0_7
  for l_0_8 = 1, mp.SIGATTR_LOG_SZ do
    if sigattr_tail[l_0_8].matched and sigattr_tail[l_0_8].attribute == 16393 then
      l_0_7 = sigattr_tail[l_0_8].utf8p2
      if l_0_7 ~= nil then
        local l_0_9 = mp.GetExecutablesFromCommandLine(l_0_7)
        if l_0_9 ~= nil and 0 < #l_0_9 then
          for l_0_10, l_0_11 in ipairs(l_0_9) do
            l_0_11 = mp.ContextualExpandEnvironmentVariables(l_0_11)
            if sysio.IsFileExists(l_0_11) then
              bm.add_related_file(l_0_11)
            end
          end
        end
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN

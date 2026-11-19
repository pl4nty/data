-- Threat: !InfrastructureShared
-- Name: Poshevin
-- Type: 15

local l_0_0 = string.lower(Remediation.Threat.Name)
if string.match(l_0_0, "poshevin%.[af]") then
  local l_0_1, l_0_2 = pcall(MpCommon.RollingQueueQuery, "PoshevinRelatedRegistries")
  local l_0_3, l_0_4 = pcall(MpCommon.RollingQueueQuery, "PoshevinRelatedFiles")
  if l_0_1 and l_0_2 ~= nil and type(l_0_2) == "table" then
    for l_0_5 in pairs(l_0_2) do
      local l_0_6 = string.lower(tostring(l_0_2[l_0_5].key))
      local l_0_7, l_0_8 = l_0_6:match("(.-\\software\\classes)\\(.*)")
      local l_0_9 = sysio.RegOpenKey(l_0_7)
      if l_0_9 then
        local l_0_10 = pcall(sysio.DeleteRegKey, l_0_9, l_0_8)
        if not l_0_10 then
          local l_0_11 = "hkcu\\software\\classes\\" .. l_0_8
          l_0_10 = pcall(Remediation.BtrDeleteRegKey, l_0_11)
        end
      end
    end
  end
  if l_0_3 and l_0_4 ~= nil and type(l_0_4) == "table" then
    for l_0_12 in pairs(l_0_4) do
      local l_0_13 = tostring(l_0_4[l_0_12].key)
      if l_0_13 and sysio.IsFileExists(l_0_13) then
        sysio.DeleteFile(l_0_13)
      else
        l_0_13 = "'" .. l_0_13 .. "'"
        if sysio.IsFileExists(l_0_13) then
          sysio.DeleteFile(l_0_13)
        else
          pcall(Remediation.BtrDeleteFile, l_0_13)
        end
      end
    end
  end
end

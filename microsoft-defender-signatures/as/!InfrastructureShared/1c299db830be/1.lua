-- Threat: !InfrastructureShared
-- Name: 1c299db830be
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") or mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") or mp.get_mpattribute("LNK_Classifier:IsUnicode") or mp.get_mpattribute("LNK_Classifier:RunMinimize") or mp.get_mpattribute("LNK_Classifier:HasArguments") then
  local l_0_0 = mp.getfilesize()
  if not l_0_0 or 1024000 < l_0_0 or headerpage == nil then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(tostring(headerpage))
  if l_0_1 == nil or 5000 < #l_0_1 then
    return mp.CLEAN
  end
  if l_0_1:find("expand-archive", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:gsub("[\\\"%+%s]", "")
  if l_0_2 and l_0_2:find("expand-archive", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

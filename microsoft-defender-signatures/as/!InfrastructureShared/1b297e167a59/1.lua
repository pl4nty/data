-- Threat: !InfrastructureShared
-- Name: 1b297e167a59
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") or mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") or mp.get_mpattribute("LNK_Classifier:IsUnicode") then
  local l_0_0 = mp.getfilesize()
  if not (l_0_0 and not (1024000 < l_0_0) and headerpage) or #headerpage > 4096 then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(tostring(headerpage))
  local l_0_2 = l_0_1:match("rundll32%.exe%s+(.+)")
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_2 = l_0_2:gsub("[^ -~]", "")
  local l_0_3, l_0_4, l_0_5 = l_0_2:match("^\\([^.]+)%.([^,]+),([^!]+)")
  if not (l_0_3 and l_0_4) or not l_0_5 then
    return mp.CLEAN
  end
  if #l_0_3 < 8 or #l_0_4 < 1 or #l_0_5 < 10 then
    return mp.CLEAN
  end
  local l_0_6 = {
    exe = true,
    dll = true,
    sys = true,
    ocx = true,
    drv = true,
    cpl = true,
    mui = true,
    ax = true,
    tmp = true,
    dat = true
  }
  if l_0_6[l_0_4] then
    return mp.CLEAN
  end
  if l_0_3:match("%s") or l_0_4:match("%s") or l_0_5:match("%s") or l_0_3:match("\\[%w]+\\") then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

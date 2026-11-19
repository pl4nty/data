-- Threat: !InfrastructureShared
-- Name: !#SLF:ExtSpoofing
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_MACHO64_FILE | BM_MACHO32_FILE | BM_PHP_FILE | BM_XAR_ARCHIVE_FILE | BM_DMG_FILE)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_2 = {
    [".doc"] = "",
    [".xls"] = "",
    [".ppt"] = "",
    [".pdf"] = "",
    [".jpg"] = "",
    [".gif"] = "",
    [".png"] = "",
    [".pic"] = "",
    [".txt"] = "",
    [".mp3"] = ""
  }
  local l_0_3 = {
    [".docx"] = "",
    [".xlsx"] = "",
    [".pptx"] = ""
  }
  if l_0_2[string.sub(l_0_1, -4)] then
    return mp.INFECTED
  end
  if l_0_3[string.sub(l_0_1, -5)] then
    return mp.INFECTED
  end
end
return mp.CLEAN

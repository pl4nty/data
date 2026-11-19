-- Threat: !InfrastructureShared
-- Name: !#Lua:FileIsPackedPersistContext.A
-- Type: 11
-- Includes: AgePrevalence
-- MpAttributes: RPF:TopLevelFile & MpNewlyCreatedHint & !ValidDigitalSignature

function checkPackerPersistContext(l_1_0, l_1_1, l_1_2)
  if l_1_1 == nil or #l_1_1 <= 1 then
    return false
  end
  local l_1_3 = 0
  if l_1_2 ~= nil and 0 < l_1_2 then
    l_1_3 = l_1_2
  end
  if mp.ispackedwith(l_1_1 .. "+") then
    if not MpCommon.QueryPersistContext(l_1_0, "FileIsPackedWith" .. l_1_1) then
      MpCommon.AppendPersistContext(l_1_0, "FileIsPackedWith" .. l_1_1, l_1_3)
    end
    return true
  else
    clearPersistContext(l_1_0, "FileIsPackedWith" .. l_1_1)
    return false
  end
  return false
end

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_1 = false
if peattributes.packersigmatched then
  checkPackerPersistContext(l_0_0, "UPX")
  checkPackerPersistContext(l_0_0, "Aspack")
  checkPackerPersistContext(l_0_0, "ASProtect")
  checkPackerPersistContext(l_0_0, "FSG")
  checkPackerPersistContext(l_0_0, "PECompact")
  checkPackerPersistContext(l_0_0, "Petite")
  checkPackerPersistContext(l_0_0, "EZip")
  checkPackerPersistContext(l_0_0, "Exe32Pack")
  checkPackerPersistContext(l_0_0, "AutoIt")
  checkPackerPersistContext(l_0_0, "AutoHotKey")
  if not MpCommon.QueryPersistContext(l_0_0, "PackerSigMatched") then
    MpCommon.AppendPersistContext(l_0_0, "PackerSigMatched", 0)
  end
  l_0_1 = true
end
if not MpCommon.QueryPersistContext(l_0_0, "FileIsPackedWithUPX") and (mp.get_mpattribute("BM_UPX_PACKED") or mp.get_mpattribute("Lua:FileIsPackedWithUPX") or mp.get_mpattribute("HSTR:UpxDecryption")) then
  MpCommon.AppendPersistContext(l_0_0, "FileIsPackedWithUPX", 0)
  l_0_1 = true
end
if l_0_1 then
  if (mp.IsTrustedFile(false) == true or mp.IsKnownFriendlyFile(l_0_0, false, false)) == true then
    return mp.CLEAN
  end
  mp.set_mpattribute("BM_MT1027.002")
  if not MpCommon.QueryPersistContext(l_0_0, "T1027.002") then
    MpCommon.AppendPersistContext(l_0_0, "T1027.002", 0)
  end
  if not MpCommon.QueryPersistContext(l_0_0, "SoftwarePacking") then
    MpCommon.AppendPersistContext(l_0_0, "SoftwarePacking", 0)
  end
end
return mp.CLEAN

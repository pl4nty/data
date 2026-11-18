-- Threat: !InfrastructureShared
-- Name: !#Lua:MshtaLnk.A
-- Type: 13
-- MpAttributes: BM_LNK_FILE & RPF:TopLevelFile

if mp.get_mpattributesubstring("SLF:Win32/LnkFileWith") and mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.CLEAN
  if MpCommon.QueryPersistContextNoPath("CLF_AM", "OfcUsrTruDocRec") then
    l_0_0 = mp.INFECTED
  end
  local l_0_1 = false
  if MpCommon.QueryPersistContextNoPath("CLF_AM", "CLF_AM_EC") then
    l_0_1 = true
  end
  if MpCommon.QueryPersistContextNoPath("CLF_AM", "CLF_AM_WM") then
    l_0_1 = true
  end
  if l_0_1 then
    local l_0_2 = MpCommon.GetPersistContextNoPath("CLF_IC")
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      mp.ReportLowfi(l_0_4, 1933116662)
    end
    l_0_0 = mp.INFECTED
  end
  if l_0_0 == mp.INFECTED then
    return mp.INFECTED
  end
end
return mp.CLEAN

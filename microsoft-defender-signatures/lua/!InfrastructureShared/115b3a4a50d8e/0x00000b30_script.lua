-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\115b3a4a50d8e\0x00000b30_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = (this_sigattrlog[2]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

    if ((this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 == nil) or (this_sigattrlog[4]).utf8p2 == "" then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

    if (string.find)((this_sigattrlog[4]).utf8p2, "https://", 1, true) then
      TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_ExfiltrationOverAlternativeProtocol_AsymmetricEncryptedNonC2Protocol")
      -- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

      ;
      (bm.trigger_sig)("BM_FileUploadOverHTTPSUsingWget", (this_sigattrlog[4]).utf8p2)
      addRelatedProcess()
      reportRelatedBmHits()
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\95b383db4cfb\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).wp1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

  if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).wp1 == nil or (string.lower)((this_sigattrlog[2]).utf8p1) ~= nil then
    local l_0_4 = nil
    if ((string.lower)((this_sigattrlog[2]).utf8p1)):match("^/.+/(.+)$") ~= nil and (string.sub)(((string.lower)((this_sigattrlog[2]).utf8p1)):match("^/.+/(.+)$"), 1, 1) == "!" and (string.sub)(((string.lower)((this_sigattrlog[2]).utf8p1)):match("^/.+/(.+)$"), -5) == "!.txt" and (((string.lower)((this_sigattrlog[2]).utf8p1)):match("^/.+/(.+)$")):len() > 10 and (((string.lower)((this_sigattrlog[2]).utf8p1)):match("^/.+/(.+)$")):len() < 25 and reportGenericRansomwareRQ("genf_linux_ransom_meta") == mp.INFECTED then
      TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
      local l_0_5, l_0_6 = , (bm.get_process_relationships)()
      for l_0_10,l_0_11 in ipairs(R5_PC82) do
        local l_0_7 = nil
        -- DECOMPILER ERROR at PC88: Confused about usage of register: R8 in 'UnsetPending'

        ;
        (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", R8_PC88.ppid)
      end
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end


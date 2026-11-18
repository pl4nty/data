-- Threat: !InfrastructureShared
-- Name: 37eb3631cedd2
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2
if l_0_0 then
  for l_0_3, l_0_4 in ipairs(l_0_0) do
    if l_0_4.ppid and l_0_4.image_path then
      local l_0_5 = string.lower(l_0_4.image_path)
      if (string.find(l_0_5, "onedrive.exe", 1, true) or string.find(l_0_5, "onedrivestandaloneupdater.exe", 1, true)) and mp.bitand(l_0_4.reason_ex, 1) == 1 then
        bm.add_related_file(l_0_5)
        if mp.IsKnownFriendlyFile(l_0_5, true, false) then
          bm.add_related_string("OFN", "OriginalOneDriveFile", bm.RelatedStringBMReport)
        else
          l_0_2 = MpCommon.GetOriginalFileName(l_0_5)
          if not l_0_2 then
            local l_0_6 = sysio.GetPEVersionInfo(l_0_5)
            if l_0_6 and l_0_6.OriginalFilename then
              l_0_2 = l_0_6.OriginalFilename
            end
          end
          if l_0_2 then
            bm.add_related_string("OFN", l_0_2, bm.RelatedStringBMReport)
            if not contains(string.lower(l_0_2), "onedrive") then
              bm.trigger_sig("OneDriveMasqueraded", l_0_2)
            end
          end
        end
        local l_0_7 = {}
        local l_0_8 = add_parents()
        local l_0_9 = add_parents_mp()
        l_0_7.parents_info = l_0_8
        l_0_7.parents_info_mp = l_0_9
        if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 then
          l_0_7.BM_Parent_TimeStamp = this_sigattrlog[14].timestamp
        elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p2 then
          l_0_7.BM_Parent_TimeStamp = this_sigattrlog[15].timestamp
        end
        bm.add_related_string("Debug_Info", safeJsonSerialize(l_0_7), bm.RelatedStringBMReport)
        for l_0_10, l_0_11 in ipairs(l_0_9) do
          if l_0_11.ImagePath then
            local l_0_12 = string.lower(l_0_11.ImagePath)
            if contains(l_0_12, "onedrive") then
              bm.trigger_sig("SuspChild_Onedrive", l_0_2 or "OriginalOneDriveFile")
              break
            end
          end
        end
        local l_0_13, l_0_14 = pcall(reportBmInfo)
        if not l_0_13 and l_0_14 then
          bm.add_related_string("bmInfoFailReason", tostring(l_0_14), bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN

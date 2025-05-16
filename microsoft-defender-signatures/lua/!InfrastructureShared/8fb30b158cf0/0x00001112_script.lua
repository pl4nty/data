-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8fb30b158cf0\0x00001112_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = {}
l_0_1.scenario = (this_sigattrlog[1]).utf8p1
l_0_1.rawchain = (this_sigattrlog[1]).utf8p2
;
(bm.add_related_string)("RemoteInvocation_scenario", l_0_1.scenario, bm.RelatedStringBMReport)
;
(bm.add_related_string)("RemoteInvocation_info", l_0_1.rawchain, bm.RelatedStringBMReport)
;
(bm.trigger_sig)(l_0_1.scenario, l_0_1.rawchain)
do
  if (this_sigattrlog[3]).matched then
    local l_0_2 = {}
    l_0_2.path = (bm.get_imagepath)()
    l_0_2.cmd = l_0_0.command_line
    l_0_2.name = (this_sigattrlog[3]).utf8p1
    l_0_1.bmdetection = l_0_2
  end
  do
    if (this_sigattrlog[2]).matched then
      local l_0_3 = {}
      l_0_3.path = (this_sigattrlog[2]).utf8p1
      l_0_3.name = (this_sigattrlog[2]).utf8p2
      l_0_1.filedetection = l_0_3
    end
    do
      if (this_sigattrlog[4]).matched then
        local l_0_4 = {}
        l_0_4.detection_tyep = (this_sigattrlog[4]).utf8p1
        l_0_4.genransommeta = (this_sigattrlog[4]).utf8p2
        l_0_1.GenRansom = l_0_4
      end
      local l_0_5 = explode(l_0_1.rawchain, ";")
      for l_0_9 = 2, #l_0_5 do
        pcall(bm.add_related_process, l_0_5[l_0_9])
      end
      local l_0_10 = (this_sigattrlog[1]).utf8p1 .. "|" .. (MpCommon.Base64Encode)((this_sigattrlog[1]).image_path)
      l_0_1.triggersessioninformation = GetRollingQueue(l_0_10)
      ;
      (bm.add_related_string)("RemoteInvocation_data", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
      local l_0_11 = {}
      local l_0_12 = {}
      l_0_12.UserName = MpCommon.WTSUserName
      l_0_12.Domain = MpCommon.WTSDomainName
      l_0_12.ClientIP = MpCommon.WTSClientAddress
      local l_0_13 = querySessionInformation(l_0_0.ppid, l_0_12)
      if l_0_13.UserName ~= nil and l_0_13.Domain ~= nil then
        l_0_11.USER_INFO = scrubData(l_0_13.Domain) .. ":" .. scrubData(l_0_13.UserName)
        l_0_11.SIG_CONTEXT = "BM:" .. l_0_1.scenario
        l_0_11.CONTENT_SOURCE = l_0_1.rawchain
        l_0_11.TAG = "NOLOOKUP"
        l_0_11.DETECTION_NAME = ""
        if l_0_1.bmdetection ~= nil then
          l_0_11.DETECTION_NAME = (l_0_1.bmdetection).name
        end
        if l_0_1.filedetection ~= nil then
          l_0_11.DETECTION_NAME = l_0_11.DETECTION_NAME .. ";" .. (l_0_1.filedetection).name
        end
        if not (l_0_13.ClientIP).Address then
          l_0_11.SOURCE_IP = l_0_13.ClientIP == nil or ""
          local l_0_14 = pcall
          local l_0_15 = mp.GetUrlReputation
          do
            local l_0_16 = {}
            -- DECOMPILER ERROR at PC183: No list found for R9 , SetList fails

            -- DECOMPILER ERROR at PC184: Overwrote pending register: R10 in 'AssignReg'

            l_0_14(l_0_15, l_0_16, "http://9ffced16-b0f2-4cf0-b08a-ef2c11396d05.info")
            return mp.INFECTED
          end
        end
      end
    end
  end
end


local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = {}
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p1
L1_1.scenario = L2_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p2
L1_1.rawchain = L2_1
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "RemoteInvocation_scenario"
L4_1 = L1_1.scenario
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "RemoteInvocation_info"
L4_1 = L1_1.rawchain
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = bm
L2_1 = L2_1.trigger_sig
L3_1 = L1_1.scenario
L4_1 = L1_1.rawchain
L2_1(L3_1, L4_1)
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = {}
  L3_1 = bm
  L3_1 = L3_1.get_imagepath
  L3_1 = L3_1()
  L2_1.path = L3_1
  L3_1 = L0_1.command_line
  L2_1.cmd = L3_1
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  L2_1.name = L3_1
  L1_1.bmdetection = L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = {}
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  L2_1.path = L3_1
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p2
  L2_1.name = L3_1
  L1_1.filedetection = L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = {}
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p1
  L2_1.detection_tyep = L3_1
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p2
  L2_1.genransommeta = L3_1
  L1_1.GenRansom = L2_1
end
L2_1 = explode
L3_1 = L1_1.rawchain
L4_1 = ";"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = 2
L4_1 = #L2_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = pcall
  L8_1 = bm
  L8_1 = L8_1.add_related_process
  L9_1 = L2_1[L6_1]
  L7_1(L8_1, L9_1)
end
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.utf8p1
L4_1 = "|"
L5_1 = MpCommon
L5_1 = L5_1.Base64Encode
L6_1 = this_sigattrlog
L6_1 = L6_1[1]
L6_1 = L6_1.image_path
L5_1 = L5_1(L6_1)
L3_1 = L3_1 .. L4_1 .. L5_1
L4_1 = GetRollingQueue
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L1_1.triggersessioninformation = L4_1
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "RemoteInvocation_data"
L6_1 = safeJsonSerialize
L7_1 = L1_1
L6_1 = L6_1(L7_1)
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = {}
L5_1 = {}
L6_1 = MpCommon
L6_1 = L6_1.WTSUserName
L5_1.UserName = L6_1
L6_1 = MpCommon
L6_1 = L6_1.WTSDomainName
L5_1.Domain = L6_1
L6_1 = MpCommon
L6_1 = L6_1.WTSClientAddress
L5_1.ClientIP = L6_1
L6_1 = querySessionInformation
L7_1 = L0_1.ppid
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
L7_1 = L6_1.UserName
if L7_1 ~= nil then
  L7_1 = L6_1.Domain
  if L7_1 ~= nil then
    L7_1 = scrubData
    L8_1 = L6_1.Domain
    L7_1 = L7_1(L8_1)
    L8_1 = ":"
    L9_1 = scrubData
    L10_1 = L6_1.UserName
    L9_1 = L9_1(L10_1)
    L7_1 = L7_1 .. L8_1 .. L9_1
    L4_1.USER_INFO = L7_1
    L7_1 = "BM:"
    L8_1 = L1_1.scenario
    L7_1 = L7_1 .. L8_1
    L4_1.SIG_CONTEXT = L7_1
    L7_1 = L1_1.rawchain
    L4_1.CONTENT_SOURCE = L7_1
    L4_1.TAG = "NOLOOKUP"
    L4_1.DETECTION_NAME = ""
    L7_1 = L1_1.bmdetection
    if L7_1 ~= nil then
      L7_1 = L1_1.bmdetection
      L7_1 = L7_1.name
      L4_1.DETECTION_NAME = L7_1
    end
    L7_1 = L1_1.filedetection
    if L7_1 ~= nil then
      L7_1 = L4_1.DETECTION_NAME
      L8_1 = ";"
      L9_1 = L1_1.filedetection
      L9_1 = L9_1.name
      L7_1 = L7_1 .. L8_1 .. L9_1
      L4_1.DETECTION_NAME = L7_1
    end
    L7_1 = L6_1.ClientIP
    if L7_1 ~= nil then
      L7_1 = L6_1.ClientIP
      L7_1 = L7_1.Address
      if not L7_1 then
        L7_1 = ""
      end
      L4_1.SOURCE_IP = L7_1
    end
    L7_1 = pcall
    L8_1 = mp
    L8_1 = L8_1.GetUrlReputation
    L9_1 = {}
    L10_1 = "http://9ffced16-b0f2-4cf0-b08a-ef2c11396d05.info"
    L9_1[1] = L10_1
    L10_1 = L4_1
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1

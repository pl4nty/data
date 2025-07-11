-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b39c75ff54\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1, l_0_2 = (bm.get_process_relationships)()
if l_0_2 then
  for l_0_6,l_0_7 in pairs(l_0_2) do
    if l_0_7.ppid and l_0_7.image_path then
      (table.insert)(l_0_0, (string.format)("%s (%s)", l_0_7.image_path, l_0_7.ppid))
      ;
      (bm.add_threat_process)(l_0_7.ppid)
      ;
      (MpCommon.SetTaintedProcess)(l_0_7.ppid, bm.BM_TAINT_OTHER)
    end
  end
end
do
  local l_0_8 = {}
  if mp.SIGATTR_LOG_SZ > 0 then
    for l_0_12 = mp.SIGATTR_LOG_SZ, 1, -1 do
      if (sigattr_tail[l_0_12]).utf8p1 and ((sigattr_tail[l_0_12]).attribute == 16384 or (sigattr_tail[l_0_12]).attribute == 16385) then
        (table.insert)(l_0_8, (string.format)("0x%x: %s", (sigattr_tail[l_0_12]).attribute, (sigattr_tail[l_0_12]).utf8p1))
        ;
        (bm.add_threat_file)((sigattr_tail[l_0_12]).utf8p1)
      end
    end
  end
  do
    local l_0_13 = safeJsonSerialize
    local l_0_14 = {}
    l_0_14.CreatedProcs = l_0_0
    l_0_14.CreatedFiles = l_0_8
    l_0_13 = l_0_13(l_0_14)
    l_0_14 = bm
    l_0_14 = l_0_14.add_related_string
    l_0_14("SuspiciousHTTPRequestHeaders_Activity", l_0_13, bm.RelatedStringBMReport)
    l_0_14 = bm
    l_0_14 = l_0_14.set_detection_string
    l_0_14(l_0_13)
    l_0_14 = mp
    l_0_14 = l_0_14.INFECTED
    return l_0_14
  end
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b33fd9ce85\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1, l_0_2 = (bm.get_process_relationships)()
if l_0_2 then
  for l_0_6,l_0_7 in pairs(l_0_2) do
    (table.insert)(l_0_0, (string.format)("%s (%s)", l_0_7.image_path, l_0_7.ppid))
    ;
    (bm.add_related_process)(l_0_7.ppid)
  end
end
do
  local l_0_8 = {}
  if mp.SIGATTR_LOG_SZ > 0 then
    for l_0_12 = mp.SIGATTR_LOG_SZ, 1, -1 do
      if (sigattr_tail[l_0_12]).attribute == 16384 or (sigattr_tail[l_0_12]).attribute == 16385 then
        (table.insert)(l_0_8, (string.format)("0x%x: %s", (sigattr_tail[l_0_12]).attribute, (sigattr_tail[l_0_12]).utf8p1))
        ;
        (bm.add_related_file)((sigattr_tail[l_0_12]).utf8p1)
      end
    end
  end
  do
    local l_0_13 = bm.add_related_string
    local l_0_14 = "SuspiciousHTTPRequestHeaders_Activity"
    local l_0_15 = safeJsonSerialize
    local l_0_16 = {}
    l_0_16.CreatedProcs = l_0_0
    l_0_16.CreatedFiles = l_0_8
    l_0_15 = l_0_15(l_0_16)
    l_0_16 = bm
    l_0_16 = l_0_16.RelatedStringBMReport
    l_0_13(l_0_14, l_0_15, l_0_16)
    l_0_13 = mp
    l_0_13 = l_0_13.INFECTED
    return l_0_13
  end
end


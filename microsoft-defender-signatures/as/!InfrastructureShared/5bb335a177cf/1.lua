-- Threat: !InfrastructureShared
-- Name: 5bb335a177cf
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].utf8p1 ~= nil then
  if mp.SIGATTR_LOG_SZ == 0 then
    return mp.CLEAN
  end
  local l_0_0, l_0_1 = pcall(MpCommon.PathToWin32Path, this_sigattrlog[1].utf8p1)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  if l_0_2:find("-- how to open these files --.txt", 1, true) or l_0_2:find("notags.html", 1, true) or l_0_2:find("nocomment.html", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = sysio.GetFileSize(l_0_1)
  local l_0_4 = {}
  l_0_4[l_0_1] = 1
  local l_0_5 = {}
  table.insert(l_0_5, {
    NotePath = l_0_1,
    NoteName = l_0_2,
    NoteSize = l_0_3
  })
  local l_0_6 = ""
  local l_0_7 = ""
  local l_0_8 = 1
  local l_0_9 = 0
  for l_0_10 = mp.SIGATTR_LOG_SZ, 1, -1 do
    local l_0_11 = sigattr_head[l_0_10]
    if (l_0_11.attribute == 16384 or l_0_11.attribute == 16386) and l_0_11.utf8p1 then
      l_0_0, l_0_6 = pcall(MpCommon.PathToWin32Path, l_0_11.utf8p1)
      if l_0_6 ~= nil and l_0_6 ~= "" then
        l_0_6 = string.lower(l_0_6)
        l_0_7 = string.match(l_0_6, "\\([^\\]+)$")
        if l_0_7 ~= nil and l_0_7 ~= "" then
          l_0_9 = sysio.GetFileSize(l_0_6)
          if l_0_9 ~= nil then
            if l_0_4[l_0_6] ~= 1 and l_0_2 == l_0_7 and l_0_9 == l_0_3 then
              l_0_8 = l_0_8 + 1
              l_0_4[l_0_6] = 1
            end
            table.insert(l_0_5, {
              NotePath = l_0_6,
              NoteName = l_0_7,
              NoteSize = l_0_9
            })
            if 2 <= l_0_8 then
              bm.add_related_string("RansomHaltY", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
              extractRansomNote(l_0_1)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN

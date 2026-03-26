-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a5b3cae96ddd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC21: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == "" or l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_3 = nil
  local l_0_4 = {"pdf", "doc", "docx", "xls", "xlsx", "ppt", "pptx", "plist", "pkg", "rtf", "txt", "jpg", "jpeg", "png", "bmp", "gif", "mov", "mp4", "mp3", "avi", "wmv", "flv", "mpg", "mpeg"}
  if l_0_3:match("([^/]+)$") == "" or l_0_3:match("([^/]+)$") == nil then
    return mp.CLEAN
  end
  local l_0_5 = nil
  if (l_0_3:match("([^/]+)$")):match("%.([^.]+)%.scpt") == "" or (l_0_3:match("([^/]+)$")):match("%.([^.]+)%.scpt") == nil then
    return mp.CLEAN
  end
  for l_0_9,l_0_10 in ipairs(l_0_4) do
    local l_0_6 = nil
    -- DECOMPILER ERROR at PC79: Confused about usage of register: R8 in 'UnsetPending'

    if l_0_6 == "pptx" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


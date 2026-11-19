-- Threat: !InfrastructureShared
-- Name: e4b32a9de2d4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  if l_0_0.command_line:find(" -c ", 1, true) then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    local l_0_5 = l_0_4.image_path
    if l_0_5 ~= nil then
      local l_0_6 = {
        ["pycharm.exe"] = true,
        ["devenv.exe"] = true,
        ["pycharm64.exe"] = true,
        ["microsoft.aether.exepool.exeworker.exe"] = true,
        ["code.exe"] = true,
        ["eclipse.exe"] = true
      }
      local l_0_7 = string.lower(l_0_5:match("\\([^\\]+)$"))
      if l_0_6[l_0_7] then
        return mp.CLEAN
      end
    end
  end
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 7db308e8d9bc
-- Type: 21

local l_0_0
local l_0_1 = MpCommon.GetPersistContextNoPath("TemplateInjc")
if l_0_1 ~= nil then
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
    l_0_0 = this_sigattrlog[1].utf8p2
  elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
    l_0_0 = this_sigattrlog[2].utf8p2
  elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
    l_0_0 = this_sigattrlog[3].utf8p2
  end
  local l_0_2
  if l_0_0 ~= nil then
    local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
    local l_0_4 = {
      [".xls"] = true,
      [".doc"] = true,
      [".ppt"] = true,
      [".pps"] = true,
      docx = true,
      pptx = true,
      ppsx = true,
      xlsx = true,
      [".rtf"] = true,
      [".xml"] = true,
      dotx = true,
      dotm = true,
      [".odt"] = true,
      xlsb = true,
      xltx = true,
      xltm = true,
      xlam = true,
      [".xla"] = true,
      docm = true,
      xlsm = true,
      pptm = true
    }
    for l_0_5, l_0_6 in ipairs(l_0_3) do
      if sysio.IsFileExists(l_0_6) then
        local l_0_7 = string.sub(l_0_6, -4)
        if l_0_4[l_0_7] then
          l_0_2 = l_0_6
        end
      end
    end
  end
  for l_0_8, l_0_9 in ipairs(l_0_1) do
    if string.match(l_0_2, l_0_9) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

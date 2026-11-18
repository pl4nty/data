-- Threat: !InfrastructureShared
-- Name: 621d7b83b7a07
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0)
  if p1_0 == nil then
    return ""
  end
  return string.lower(p1_0)
end

local function r0_1(p2_0)
  local r2_0 = string.lower(p2_0)
  return function(p3_0)
    local r3_0 = p3_0 ~= nil and p3_0.ProductName ~= nil and string.lower(p3_0.ProductName) == r2_0
    return r3_0
  end
end

local function r0_2(p4_0)
  local r4_0 = string.lower(p4_0)
  return function(p5_0)
    return p5_0 ~= nil
      and p5_0.ProductName ~= nil
      and string.find(string.lower(p5_0.ProductName), r4_0, 1, true) ~= nil
  end
end

local function r0_3(p6_0)
  local r6_0 = string.lower(p6_0)
  return function(p7_0)
    local r7_0 = p7_0 ~= nil
      and p7_0.OriginalFilename ~= nil
      and string.lower(p7_0.OriginalFilename) == r6_0
    return r7_0
  end
end

local function r0_4(p8_0)
  local r8_0 = string.lower(p8_0)
  return function(p9_0)
    return p9_0 ~= nil
      and p9_0.CompanyName ~= nil
      and string.find(string.lower(p9_0.CompanyName), r8_0, 1, true) ~= nil
  end
end

local function r0_5(p10_0)
  local r10_0 = string.lower(p10_0)
  return function(p11_0)
    local r11_0 = p11_0 ~= nil
      and p11_0.CompanyName ~= nil
      and string.lower(p11_0.CompanyName) == r10_0
    return r11_0
  end
end

local function r0_6(p12_0)
  local r12_0 = string.lower(p12_0)
  return function(p13_0)
    local r13_0 = p13_0 ~= nil
      and p13_0.FileDescription ~= nil
      and string.lower(p13_0.FileDescription) == r12_0
    return r13_0
  end
end

local function r0_7(p14_0)
  local r14_0 = string.lower(p14_0)
  return function(p15_0, p15_1)
    local r15_0 = string.find(r0_0(p15_1), r14_0, 1, true)
    return r15_0 ~= nil
  end
end

local function r0_8(p16_0)
  local r16_0 = string.lower(p16_0)
  return function(p17_0)
    return p17_0 ~= nil
      and p17_0.__image_path ~= nil
      and string.find(string.lower(p17_0.__image_path), r16_0, 1, true) ~= nil
  end
end

local function r0_9(p18_0)
  local r18_0 = {}
  for r18_1, r18_2 in ipairs(p18_0) do
    r18_0[r18_1] = string.lower(r18_2)
  end
  return function(p19_0)
    if p19_0 ~= nil and p19_0.CompanyName ~= nil then
      local r19_0 = string.lower(p19_0.CompanyName)
      for r19_1, r19_2 in ipairs(r18_0) do
        if string.find(r19_0, r19_2, 1, true) then
          return true
        end
      end
      return false
    end
    return false
  end
end

local function r0_10()
  return function(p21_0, p21_1, p21_2)
    local r21_0 = p21_0 and p21_0.CompanyName
    if r21_0 ~= nil and r21_0 ~= "" then
      return false
    end
    local r21_1 = p21_2 ~= nil
      and p21_2.image_path ~= nil
      and string.lower(p21_2.image_path):match("([^\\]+)$")
      or ""
    local r21_2 = string.sub(r21_1, 1, 5)
    r21_2 = r21_2 ~= "codex" and r21_1 ~= "chatgpt.exe"
    return r21_2
  end
end

local function r0_11(p22_0)
  local r22_0 = string.lower(p22_0)
  return function(p23_0, p23_1, p23_2)
    local r23_0 = (p23_2 ~= nil
        and p23_2.image_path ~= nil
        and string.lower(p23_2.image_path):match("([^\\]+)$")
        or "")
      ~= r22_0
    return r23_0
  end
end

local function r0_12(...)
  local r24_1 = { ... }
  return function(p25_0, p25_1, p25_2)
    for r25_0, r25_1 in ipairs(r24_1) do
      if r25_1(p25_0, p25_1, p25_2) then
        return true
      end
    end
    return false
  end
end

local function r0_13(...)
  local r26_1 = { ... }
  return function(p27_0, p27_1, p27_2)
    for r27_0, r27_1 in ipairs(r26_1) do
      if not r27_1(p27_0, p27_1, p27_2) then
        return false
      end
    end
    return true
  end
end

local function r0_14()
  return function(p29_0)
    return r0_0(p29_0 and p29_0.FileDescription) == ""
  end
end

local function r0_15()
  return function()
    return true
  end
end

local r0_16 = {
  ["claude.exe"] = {
    {
      atid = "2c8b82c4-d647-5bb0-036f-b97b3e7ba2eb", name = "claude_desktop", vendor = "anthropic",
      check = r0_1("Claude")
    },
    {
      atid = "10bea2a8-665b-0c5c-9c9f-8c92dc2ea294", name = "claude_code", vendor = "anthropic",
      check = r0_1("Claude Code")
    }
  },
  ["chatgpt.exe"] = {
    {
      atid = "aeb0118e-cfba-0538-1d7e-8708121db057", name = "chatgpt_desktop", vendor = "openai",
      check = r0_15()
    }
  },
  ["chatgpt classic.exe"] = {
    {
      atid = "0781d08d-1077-e9e6-1b38-66dcc97eda7f", name = "chatgpt_classic", vendor = "openai",
      check = r0_15()
    }
  },
  ["ollama.exe"] = {
    {
      atid = "9b6dd624-9111-d0cc-6a24-5b1effcc5a88", name = "ollama", vendor = "ollama",
      check = r0_15()
    }
  },
  ["poe.exe"] = {
    {
      atid = "e451e616-3930-b5a0-43b4-0e1758131002", name = "poe_desktop", vendor = "quora",
      check = r0_12(r0_4("Quora"), r0_2("Poe"))
    }
  },
  ["node.exe"] = {
    {
      atid = "37a87c3e-3193-7d5c-50e3-6eefc17d0544", name = "deepseek_harness", vendor = "deepseek",
      check = r0_13(r0_1("Node.js"),
        r0_12(r0_7("\\node_modules\\@deepseek-ai\\dsh\\lib\\bin.js"),
          r0_7("/node_modules/@deepseek-ai/dsh/lib/bin.js")))
    },
    {
      atid = "7c5b6d96-036c-1311-cd08-bd735af44b7c", name = "qwen_code", vendor = "alibaba",
      check = r0_13(r0_7("qwen-code"), r0_12(r0_7("cli.js"), r0_7("cli-entry.js")))
    },
    {
      atid = "e3f0fbe2-6cbb-fb95-e657-7db8036b3969", name = "pi", vendor = "earendil",
      check = r0_13(r0_7("earendil-works"), r0_7("pi-coding-agent"), r0_7("cli.js"))
    },
    {
      atid = "56b0b430-e1f2-1f5d-3afc-c239777988fb", name = "gemini_cli", vendor = "google",
      check = r0_7("@google\\gemini-cli")
    },
    {
      atid = "44609225-a725-6933-2176-4f6fe91cd344", name = "openclaw", vendor = "openclaw",
      check = r0_7("openclaw")
    }
  },
  ["qwen code desktop.exe"] = {
    {
      atid = "afbfbc39-084a-e873-47e1-9e6f2e4ff703", name = "qwen_code_desktop", vendor = "alibaba",
      check = r0_1("Qwen Code Desktop")
    }
  },
  ["qwen.exe"] = {
    {
      atid = "7ededcd7-fc8a-837c-a4c2-7891e6acffc5", name = "qwen_studio", vendor = "alibaba",
      check = r0_6("Qwen Chat")
    }
  },
  ["cursor.exe"] = {
    {
      atid = "3eca39de-0876-1095-8b7f-83e0cbd106d3", name = "cursor", vendor = "anysphere",
      check = r0_15()
    }
  },
  ["copilot.exe"] = {
    {
      atid = "cb8219f6-4821-44ed-6106-155582bf0efe", name = "copilot-cli", vendor = "github",
      check = r0_1("GitHub Copilot CLI")
    }
  },
  ["github.exe"] = {
    {
      atid = "5ec25d49-edd4-8e8e-05ad-4cc2e2862849", name = "copilot-app", vendor = "github",
      check = r0_1("GitHub Copilot")
    }
  },
  ["codex.exe"] = {
    {
      atid = "6e9f6e7e-6603-d645-8bab-35cbca16b961", name = "codex_desktop", vendor = "openai",
      check = r0_4("OpenAI")
    },
    {
      atid = "af30b4b6-d6da-2414-2f26-d47b502ac273", name = "codex_cli", vendor = "openai",
      check = r0_10()
    }
  },
  ["nanobot.exe"] = {
    {
      atid = "126ae904-efec-59e7-0f2d-4e93fcae3f12", name = "nanobot", vendor = "nanobot",
      check = r0_15()
    }
  },
  ["zeroclaw.exe"] = {
    {
      atid = "57e1a240-bfdb-e794-cce1-f1d5ae4042a7", name = "zeroclaw", vendor = "zeroclaw",
      check = r0_15()
    }
  },
  ["opencode.exe"] = {
    {
      atid = "0c813329-4c65-a125-88b5-195c07a8dce8", name = "opencode", vendor = "anoma",
      check = r0_15()
    }
  },
  ["clawpilot.exe"] = {
    {
      atid = "c7a6c8ab-8ac0-1b9d-4504-7b5e37bf7360", name = "clawpilot", vendor = "microsoft",
      check = r0_15()
    }
  },
  ["microsoft scout.exe"] = {
    {
      atid = "43849c25-a0cc-bcbe-bb98-a7c126573fe5", name = "scout", vendor = "microsoft",
      check = r0_15()
    }
  },
  ["foundrylocald.exe"] = {
    {
      atid = "22d30330-3342-f4a1-fcb2-43c37b022e88", name = "foundry_local", vendor = "microsoft",
      check = r0_13(r0_8("windowsapps"), r0_8("microsoft.foundrylocal_"))
    }
  },
  ["foundry.exe"] = {
    {
      atid = "22d30330-3342-f4a1-fcb2-43c37b022e88", name = "foundry_local", vendor = "microsoft",
      check = r0_13(r0_8("windowsapps"), r0_8("microsoft.foundrylocal_"))
    }
  },
  ["antigravity.exe"] = {
    {
      atid = "a2766fb1-60b1-8a68-c6f5-4bc79a1c70c5", name = "antigravity_desktop", vendor = "google",
      check = r0_15()
    }
  },
  ["antigravity ide.exe"] = {
    {
      atid = "a7eae699-e4aa-7616-978c-92d8e2a33ee1", name = "antigravity_ide", vendor = "google",
      check = r0_15()
    }
  },
  ["agy.exe"] = {
    {
      atid = "3c4c2d83-a35a-3670-5f28-667af70c1943", name = "antigravity_cli", vendor = "google",
      check = r0_15()
    }
  },
  ["windsurf.exe"] = {
    {
      atid = "d8564ebd-b97b-6ffc-cba9-c5bbe5a18309", name = "windsurf", vendor = "cognition",
      check = r0_15()
    }
  },
  ["cortex code.exe"] = {
    {
      atid = "dcc73620-fefb-0113-5cd1-7a01f3cf73e6", name = "cortex_code", vendor = "snowflake",
      check = r0_13(r0_6("Cortex Code"), r0_4("Snowflake"))
    }
  },
  ["cortex.exe"] = {
    {
      atid = "d9945ae2-6076-0e51-e51d-70fc5bad1e0f", name = "cortex_code_cli", vendor = "snowflake",
      check = r0_13(r0_6("Cortex Code CLI"), r0_4("Snowflake"))
    }
  },
  ["goose.exe"] = {
    {
      atid = "b8aa1ea2-52af-4283-bf53-eb3dfa909a86", name = "goose_desktop", vendor = "aaif",
      check = r0_6("Goose")
    },
    {
      atid = "97483b0c-ca4a-e4b3-b54f-1354157f10e6", name = "goose_cli", vendor = "aaif",
      check = r0_13(r0_14(), r0_8("\\.local\\bin\\"))
    }
  },
  ["hermes.exe"] = {
    {
      atid = "d35c32e8-71ba-a7cd-0603-7d8fd6aa1fb6", name = "hermes_agent", vendor = "nous_research",
      check = r0_8("hermes-agent")
    }
  },
  ["hermes agent.exe"] = {
    {
      atid = "d35c32e8-71ba-a7cd-0603-7d8fd6aa1fb6", name = "hermes_agent", vendor = "nous_research",
      check = r0_15()
    }
  },
  ["junie.exe"] = {
    {
      atid = "70cee1bc-8a36-2445-9559-f8111565911a", name = "junie", vendor = "jetbrains",
      check = r0_15()
    }
  },
  ["perplexity.exe"] = {
    {
      atid = "a955e425-64f0-add0-975e-b748ad30e590", name = "perplexity_desktop",
      vendor = "perplexity", check = r0_4("Perplexity")
    }
  },
  ["perplexity ai.exe"] = {
    {
      atid = "a955e425-64f0-add0-975e-b748ad30e590", name = "perplexity_desktop",
      vendor = "perplexity", check = r0_4("Perplexity AI")
    }
  },
  ["warp.exe"] = {
    {
      atid = "042a770a-3392-59c2-8d1e-38af2d17f8dd", name = "warp", vendor = "warp",
      check = r0_4("Denver Technologies")
    }
  },
  ["trae.exe"] = {
    {
      atid = "d625b5c7-cd06-af35-0873-7ee79377aab3", name = "trae_ide", vendor = "bytedance",
      check = r0_1("Trae")
    }
  },
  ["kiro.exe"] = {
    {
      atid = "d71c6a23-52bd-4a1a-24b5-1eb0447d09ac", name = "kiro_ide", vendor = "amazon",
      check = r0_4("Amazon")
    }
  },
  ["kiro-cli.exe"] = {
    {
      atid = "f5fb4181-a90d-3720-03ec-189e71e40a94", name = "kiro_cli", vendor = "amazon",
      check = r0_15()
    }
  },
  ["kilo.exe"] = {
    {
      atid = "1417fe62-d520-b57d-df81-5f84af352849", name = "kilo_cli", vendor = "kilocode",
      check = r0_13(r0_8("kilocode"), r0_8("cli"))
    }
  },
  ["cline.exe"] = {
    {
      atid = "55a4771d-2f95-718d-5cd1-bba61fa2f1b8", name = "cline_cli", vendor = "cline",
      check = r0_8("cli-windows")
    }
  },
  ["amp.exe"] = {
    {
      atid = "e56d2b11-35ae-a482-25eb-9b25a9c788be", name = "amp_cli", vendor = "amp",
      check = r0_12(r0_8("\\.amp\\bin\\amp.exe"),
        r0_8("\\node_modules\\@ampcode\\cli\\bin\\amp.exe"),
        r0_13(r0_5("Oven"), r0_1("Bun"), r0_6("Bun"), r0_3("bun.exe")))
    }
  },
  ["omp.exe"] = {
    {
      atid = "538c5848-9edb-7e10-f9ee-608f4c774f66", name = "oh_my_pi", vendor = "stencil",
      check = r0_12(r0_8("\\appdata\\local\\omp\\"),
        r0_13(r0_5("Oven"), r0_1("Bun"), r0_6("Bun"), r0_3("bun.exe")))
    }
  },
  ["buzz-desktop.exe"] = {
    {
      atid = "7967a5c1-2f53-7a8d-7f80-b518bfecfbfb", name = "buzz", vendor = "block",
      check = r0_1("Buzz")
    }
  },
  ["zcode.exe"] = {
    {
      atid = "fed9c455-743a-7927-2049-edc6982bee7f", name = "zcode", vendor = "z_ai",
      check = r0_5("ZCode")
    }
  },
  ["devin.exe"] = {
    {
      atid = "cd80d41c-351a-4699-d9a5-1537c0a463a1", name = "devin_desktop", vendor = "cognition",
      check = r0_9({ "Codeium", "Exafunction", "Cognition" })
    },
    {
      atid = "bfa63e17-ccf0-0de3-ed25-215ae4527006", name = "devin_cli", vendor = "cognition",
      check = r0_8("\\devin\\cli\\bin\\")
    }
  },
  ["kimi.exe"] = {
    {
      atid = "c6335b72-2b6e-bc84-0064-18b6fb0bd400", name = "kimi_work", vendor = "moonshot_ai",
      check = r0_13(r0_1("Kimi"), r0_5("北京月之暗面科技有限公司"))
    },
    {
      atid = "0a3eded1-aec5-f9a2-b5ae-9b04b00c93e9", name = "kimi_code_cli", vendor = "moonshot_ai",
      check = r0_8("\\.kimi-code\\bin\\")
    }
  },
  ["factory-desktop.exe"] = {
    {
      atid = "69b910d6-a8f3-df06-003b-e3d8eb97cecc", name = "factory_app", vendor = "factory",
      check = r0_13(r0_1("Factory"), r0_5("The San Francisco AI Factory, Inc."))
    }
  },
  ["droid.exe"] = {
    {
      atid = "80b36595-6722-e6df-f742-40c9d118bd4d", name = "droid_cli", vendor = "factory",
      check = r0_13(r0_1("Bun"), r0_5("Oven"), r0_11("factory-desktop.exe"))
    }
  },
  ["replit.exe"] = {
    {
      atid = "8505c365-d5fb-256f-ffca-3d3f2a327995", name = "replit_agent", vendor = "replit",
      check = r0_13(r0_1("Replit"), r0_5("Replit"))
    }
  },
  ["qclaw.exe"] = {
    {
      atid = "4a9f9764-0900-548e-9fa4-fbe4186df19d", name = "qclaw", vendor = "tencent",
      check = r0_15()
    }
  },
  ["grok.exe"] = {
    {
      atid = "b89f05f1-1b66-9cdf-2b1d-4a684b2442a7", name = "grok_build", vendor = "spacexai",
      check = r0_8("\\.grok\\bin\\")
    }
  },
  ["agent.exe"] = {
    {
      atid = "b89f05f1-1b66-9cdf-2b1d-4a684b2442a7", name = "grok_build", vendor = "spacexai",
      check = r0_8("\\.grok\\bin\\")
    }
  },
  ["grok bot.exe"] = {
    {
      atid = "0535c02a-cb74-b6ae-aa3e-3a2b8873917a", name = "grok_bot", vendor = "spacexai",
      check = r0_1("Grok Bot")
    }
  },
  ["lm studio.exe"] = {
    {
      atid = "7a59ab71-7f58-13f5-6d16-7f93b2adefb5", name = "lm_studio", vendor = "element_labs",
      check = r0_13(r0_6("LM Studio"), r0_4("LM Studio"))
    }
  },
  ["bionic.exe"] = {
    {
      atid = "3e08df1e-2f76-a90c-bdf0-160e7f0ad2f7", name = "bionic", vendor = "element_labs",
      check = r0_4("LM Studio")
    }
  },
  ["copilotapp.exe"] = {
    {
      atid = "4db2e094-6283-e752-635e-c889ed8bb45b", name = "copilot", vendor = "microsoft",
      check = r0_1("Copilot")
    }
  },
  ["copilotapp_proxy.exe"] = {
    {
      atid = "4db2e094-6283-e752-635e-c889ed8bb45b", name = "copilot", vendor = "microsoft",
      check = r0_15()
    }
  },
  ["copilotapphost.exe"] = {
    {
      atid = "4db2e094-6283-e752-635e-c889ed8bb45b", name = "copilot", vendor = "microsoft",
      check = r0_15()
    }
  }
}
local r0_17 = mp.GetScannedPPID()
if r0_17 ~= nil and r0_17 ~= "" then
  local r0_18 = MpCommon.DoesProcessHaveAttribute(r0_17, "AIDiscovery:Agent")
    or MpCommon.DoesProcessHaveAttribute(r0_17, "inherit:AIDiscovery:Agent")
  if r0_18 then
    local r0_19 = MpCommon.DoesProcessHaveAttribute(r0_17, "AIDiscovery:Vendor")
      or MpCommon.DoesProcessHaveAttribute(r0_17, "inherit:AIDiscovery:Vendor")
    if r0_19 then
      return mp.CLEAN
    end
  end
  local r0_20 = MpCommon.GetImagePathFromPid(r0_17)
  if r0_20 ~= nil and r0_20 ~= "" then
    local r0_21 = MpCommon.PathToWin32Path(r0_20) or r0_20
    local r0_22 = string.lower(r0_21)
    local r0_23 = r0_22
    r0_22 = r0_23.match(r0_23, "([^\\]+)$")
    r0_23 = nil
    if r0_22 == r0_23 then
      return mp.CLEAN
    end
    if r0_22 == "copilotapp.exe" or r0_22 == "copilotapp_proxy.exe" or r0_22 == "copilotapphost.exe" then
      local r0_24 = {
        ["ae3c6ef7-966a-48ad-8f3d-d74a2e8fba51"] = true,
        ["09416fe1-0949-411c-b454-fdf91731a850"] = true,
        ["72e63327-b68c-4ef0-a00b-87aca980381e"] = true,
        ["25da5199-9820-4042-a484-cbff4677534c"] = true,
        ["d7c7c745-195f-4223-9c7a-99fb420fd000"] = true
      }
      local r0_25 = versioning.GetOrgID()
      if type(r0_25) ~= "string" then
        return mp.CLEAN
      end
      local r0_26 = string.lower(r0_25)
      r0_26 = r0_24[r0_26]
      if not r0_26 then
        return mp.CLEAN
      end
      local r0_27 = versioning.GetOsBuildNumber()
      local r0_28 = nil
      if r0_27 == 28000 then
        r0_28 = 3231
      else
        if r0_27 ~= 26100 and r0_27 ~= 26200 and r0_27 ~= 26300 then
          return mp.CLEAN
        end
        r0_28 = 9697
      end
      local r0_29 = versioning.GetOsBuildMin()
      if type(r0_29) ~= "number" or r0_29 < r0_28 then
        return mp.CLEAN
      end
    end
    local r0_30 = r0_16[r0_22]
    if r0_30 == nil then
      return mp.CLEAN
    end
    local r0_31 = sysio.GetPEVersionInfo
    r0_31 = r0_31(r0_21) or {}
    r0_31.__image_path = r0_21
    local r0_32 = mp.GetProcessCommandLine
    r0_32 = r0_32(r0_17) or ""
    local r0_33 = mp.GetParentProcInfo
    r0_33 = r0_33() or {}
    for r0_34, r0_35 in ipairs(r0_30) do
      local r0_36 = r0_35.check(r0_31, r0_32, r0_33)
      if r0_36 then
        MpCommon.AddProcessAttribute(r0_17, "AIDiscovery:Vendor", r0_35.vendor, true)
        MpCommon.AddProcessAttribute(r0_17, "AIDiscovery:Agent", r0_35.name, true)
        MpCommon.AddProcessAttribute(r0_17, "AIDiscovery:Atid", r0_35.atid, true)
        mp.set_mpattribute("MpDisableCaching")
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN

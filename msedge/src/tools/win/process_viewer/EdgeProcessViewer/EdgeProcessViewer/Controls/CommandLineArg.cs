// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

namespace EdgeProcessViewer.Controls {
  /// <summary>
  /// This object encapsulates the argument string to look for and enables
  /// the creation of dynamic property names tied to the argument.
  /// </summary>
  public class CommandLineArg : ColumnDefinition {
    public const string WATCHED_ARG_PREFIX = "watchedArg";
    public static readonly string[] COMMAND_LINE_DELIMITERS = { "--", "/" };
    public static readonly string[] COMMAND_LINE_ARGUMENT_DELIMITERS =
      { ":", "=" };

    /// <summary>
    /// Remove the argument name and all the argument delimiters from the
    /// command line
    /// </summary>
    public string StripCommandLineArgument(string fullCommandLineArgument) {
      string returnValue = fullCommandLineArgument.Replace(Label, "");

      foreach (string delimiter in COMMAND_LINE_ARGUMENT_DELIMITERS) {
        returnValue = returnValue.Replace(delimiter, "");
      }

      return returnValue;
    }

    /// <summary>
    /// This method will strip delimiters from the argument passed in.
    /// </summary>
    /// <param name="argument"></param>
    /// <returns></returns>
    private string CureArgument(string argument) {
      string curedArgument = argument.Split(COMMAND_LINE_DELIMITERS, System.StringSplitOptions.RemoveEmptyEntries)[0];
      return curedArgument.Split(COMMAND_LINE_ARGUMENT_DELIMITERS, System.StringSplitOptions.None)[0];
    }

    /// <summary>
    /// Constructs a new CommandLineArg based on the argument
    /// </summary>
    /// <param name="argument">The argument</param>
    public CommandLineArg(string argument) {
      this.label_ = CureArgument(argument);
      this.name_ = WATCHED_ARG_PREFIX + GetHashCode().ToString();
    }

    /// <summary>
    /// Determines equality with other objects
    /// </summary>
    /// <param name="o"></param>
    /// <returns></returns>
    public override bool Equals(object o) {
      if (o is CommandLineArg other) {
        return other.Label == Label;
      }

      return false;
    }

    /// <summary>
    /// The hash code relating to the Command Line. Based off the argument name
    /// </summary>
    /// <returns></returns>
    public override int GetHashCode() {
      return Label.GetHashCode();
    }
  }
}

public class Util {
  int str_to_int[0];
  0 => str_to_int["0"];
  1 => str_to_int["1"];
  2 => str_to_int["2"];
  3 => str_to_int["3"];
  4 => str_to_int["4"];
  5 => str_to_int["5"];
  6 => str_to_int["6"];
  7 => str_to_int["7"];
  8 => str_to_int["8"];
  9 => str_to_int["9"];
  10 => str_to_int["10"];
  11 => str_to_int["11"];
  12 => str_to_int["12"];
  13 => str_to_int["13"];
  14 => str_to_int["14"];
  15 => str_to_int["15"];
  16 => str_to_int["16"];

  /* ====Midi Helper Functions==== */
  /* Note: channels are counted starting at 1, not 0 */
  public MidiMsg getMidiNoteOff(int channel, int note) {
    MidiMsg msg;
    128 + (channel - 1) => msg.data1;
    note => msg.data2;
    return msg;
  }

  public MidiMsg getMidiNoteOn(int channel, int note, int velocity) {
    MidiMsg msg;
    144 + (channel - 1) => msg.data1;
    note => msg.data2;
    velocity => msg.data3;
    return msg;
  }

  public string multString(int times, string str) {
    str => string orig;
    for (0 => int i; i < times; i++) {
      orig +=> str;
    }
    return str;
  }
}

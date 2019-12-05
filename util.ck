public class Util {
  int STR_TO_INT[0];
  0 => STR_TO_INT["0"];
  1 => STR_TO_INT["1"];
  2 => STR_TO_INT["2"];
  3 => STR_TO_INT["3"];
  4 => STR_TO_INT["4"];
  5 => STR_TO_INT["5"];
  6 => STR_TO_INT["6"];
  7 => STR_TO_INT["7"];
  8 => STR_TO_INT["8"];
  9 => STR_TO_INT["9"];
  10 => STR_TO_INT["10"];
  11 => STR_TO_INT["11"];
  12 => STR_TO_INT["12"];
  13 => STR_TO_INT["13"];
  14 => STR_TO_INT["14"];
  15 => STR_TO_INT["15"];
  16 => STR_TO_INT["16"];

  // this synchronizes to period
  fun void synchronize(dur T) {
      T - (now % T) => now;
  }

  /* ====Midi Helper Functions==== */
  fun void connectMidiPort(MidiOut @ mout, int midi_port) {
    if (!mout.open(midi_port)) {
      me.exit();
    } else {
      <<< "connected to midi port " + midi_port >>>;
    }
  }

  /* Note: channels are counted starting at 1, not 0 */
  fun MidiMsg getMidiNoteOff(int channel, int note) {
    MidiMsg msg;
    128 + (channel - 1) => msg.data1;
    note => msg.data2;
    return msg;
  }

  fun MidiMsg getMidiNoteOn(int channel, int note, int velocity) {
    MidiMsg msg;
    144 + (channel - 1) => msg.data1;
    note => msg.data2;
    velocity => msg.data3;
    return msg;
  }

  fun MidiMsg getMidiClock() {
    MidiMsg msg;
    248 => msg.data1;
    return msg;
  }

  fun string multString(int times, string str) {
    str => string orig;
    for (0 => int i; i < times; i++) {
      orig +=> str;
    }
    return str;
  }

  /* Math helper */

  /*
  x0: horizontal offset
  L: Maximum value
  k: slope gradation
  */
  fun float logistic(float x, float x0, float L, float k) {
    return (L / (1 + Math.exp((-1. * k) * (x - x0))));
  }
}

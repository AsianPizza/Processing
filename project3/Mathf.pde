public static class Mathf {

  public static float clamp(float value, float min, float max) {
    return max(min, min(max, value));
  }
}

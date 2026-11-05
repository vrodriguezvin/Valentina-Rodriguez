grafico_h <- tardar_vs_incumplir %>%
  mutate(estado = ifelse(llego_tarde, "Llegó tarde", "A tiempo")) %>%
  ggplot(aes(x = ordenes, y = puntaje_promedio, fill = estado)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("A tiempo" = "grey55", "Llegó tarde" = "#d35400")) +
  labs(title = "¿Pesa más tardar o incumplir la fecha?",
           subtitle = "Puntaje promedio según tiempo total de entrega",
           x = "Tiempo total entre compra y entrega", y = "Puntaje promedio (1 a 5)",
           fill = NULL) +theme_minimal()


df %>%
  mutate(estado = ifelse(llego_tarde, "Tarde", "A tiempo")) %>%
  ggplot(aes(x = estado, fill = review_score <= 2)) +
  geom_bar(position = "fill") +
  labs(title = "Reseñas negativas según puntualidad", x = "Entrega", y = "Proporción", fill = "Mala reseña")


ggplot(df, aes(x = llego_tarde)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Cantidad de pedidos según puntualidad", x = "Llegó tarde", y = "Cantidad de pedidos")


df %>%
  filter(dias_atraso > 0) %>%
  mutate(tramo = cut(dias_atraso, breaks = c(0, 3, 7, 14, Inf), labels = c("1-3 días", "4-7 días", "8-14 días", "15+ días"))) %>%
  ggplot(aes(x = tramo, y = review_score)) +
  stat_summary(fun = mean, geom = "col", fill = "steelblue") +
  labs(title = "Calificación promedio según días de atraso", x = "Días de atraso", y = "Calificación promedio") +
  theme_minimal()
